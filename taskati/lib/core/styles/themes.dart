import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/text_styles.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: AppFonts.lexend,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.blackColor,
      seedColor: AppColors.primaryColor,
      tertiaryContainer:
          AppColors.accentColor, // used for tab bar background color
    ),
    cardColor: AppColors.backgroundColor,
    iconTheme: IconThemeData(color: AppColors.blackColor),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.blackColor,
        fontFamily: AppFonts.lexend,
      ),
      foregroundColor: AppColors.blackColor,
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.backgroundColor,
      ),
      dividerHeight: 0,
      labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.accentColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.backgroundColor,
      filled: true,
      hintStyle: TextStyles.caption1.copyWith(color: AppColors.secondaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: AppColors.backgroundColor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
      dialBackgroundColor: AppColors.backgroundColor,
      hourMinuteColor: AppColors.primary50Color,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    fontFamily: AppFonts.lexend,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      onSurface: AppColors.backgroundColor,
      seedColor: AppColors.primaryColor,
      tertiaryContainer: AppColors.blackColor,
    ),
    cardColor: AppColors.blackColor,
    iconTheme: IconThemeData(color: AppColors.backgroundColor),
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyles.title.copyWith(
        color: AppColors.backgroundColor,
        fontFamily: AppFonts.lexend,
      ),
      foregroundColor: AppColors.backgroundColor,
    ),
    tabBarTheme: TabBarThemeData(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyles.caption1.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.backgroundColor,
      ),
      dividerHeight: 0,
      labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(color: AppColors.accentColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.blackColor,
      filled: true,
      hintStyle: TextStyles.caption1.copyWith(color: AppColors.secondaryColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.blackColor,
      headerBackgroundColor: AppColors.primaryColor,
      headerForegroundColor: AppColors.backgroundColor,
    ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.blackColor,
      dialBackgroundColor: AppColors.blackColor,
      hourMinuteColor: AppColors.primary50Color,
    ),
  );
}

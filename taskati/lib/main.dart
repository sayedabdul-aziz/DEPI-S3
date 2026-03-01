import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/services/hive_helper.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/styles/themes.dart';
import 'package:taskati/features/splash/splash_screen.dart';
import 'package:taskati/hive/hive_adapters.dart';

// initialize hive
// open boxes
// if you need to cache Object, create a custom adapter for that object
// create model class
// add file for hive adapters
// register adapters

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPref.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await HiveHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveHelper.userBox.listenable(),
      builder: (context, box, child) {
        bool isDark = HiveHelper.getCachedThemeMode();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          builder: (context, child) {
            return SafeArea(
              top: false,
              bottom: Platform.isAndroid,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: isDark
                          ? AppColors.blackColor
                          : AppColors.backgroundColor,
                    ),
                    Image.asset(
                      AppAssets.bg,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    child!,
                  ],
                ),
              ),
            );
          },
          home: SplashScreen(),
        );
      },
    );
  }
}

// 1) handle themes light and dark in core/styles/themes.dart
// 2) use dark and light inside MaterialApp
// 3) use themeMode to change the theme
// 4) use cached data to get the theme mode
// 5) do button to change the theme
// 6) take round for all screens to handle the theme

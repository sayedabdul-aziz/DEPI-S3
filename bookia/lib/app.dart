import 'dart:io';

import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/styles/themes.dart';
import 'package:bookia/flavor_env.dart';
import 'package:chili_debug_view/chili_debug_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemes.lightTheme,
      builder: (context, child) {
        return FlavorEnvironment.currentFlavor == FlavorEnv.staging
            ? DebugView(
                navigatorKey: navigatorKey,
                showDebugViewButton: true,
                app: SafeArea(
                  top: false,
                  bottom: Platform.isAndroid,
                  child: child ?? Container(),
                ),
              )
            : SafeArea(
                top: false,
                bottom: Platform.isAndroid,
                child: child ?? Container(),
              );
      },
    );
  }
}

// flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

// Feature First

// Auth (data, Presentation)
// Home

// Layer First

// models
// pages
// providers
// data
// repo

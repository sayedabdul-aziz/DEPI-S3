import 'dart:io';

import 'package:bookia/core/routes/app_router.dart';
import 'package:bookia/core/styles/themes.dart';
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
        return DebugView(
          navigatorKey: navigatorKey,
          showDebugViewButton: true,
          app: SafeArea(
            top: false,
            bottom: Platform.isAndroid,
            child: child ?? Container(),
          ),
        );
      },
    );
  }
}



// Feature First

// Auth (data, Presentation)
// Home


// Layer First

// models
// pages
// providers
// data
// repo

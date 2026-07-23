import 'package:bookia/app.dart';
import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/core/utils/bloc_observer.dart';
import 'package:bookia/flavor_env.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> mainCommon(FlavorEnv env) async {
  FlavorEnvironment.setCurrentEnvironment(env);
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => EasyLocalization(
        supportedLocales: [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: const MainApp(),
      ),
    ),
  );
}

// data resources :

// 1- Apis (Backend)(Remote)
// 2- Local Storage (Shared Preferences, Hive, SQLITE) (Local)
// 3- Backend Services (Firebase, Supabase) (Remote)
// 4- Assets (Json, csv)
// 5- static data

// UI <=> Cubit <=> Data(Repo)

// Layers For Features:
// Data : (Repositories(Api Integration) - Models(Request, Response))
// Presentation : (Cubit - Pages - Widgets)

// Apis Keywords
// 1- BaseUrl => https://api.themoviedb.org/3/
// 2- Endpoint => movie/now_playing
// 3- Postman => test APIs
// 4- Methods => GET, POST, PUT, DELETE, PATCH
// 5- Request (EP, Method, [Body, Headers, Query Params])
// 6- Response (Status Code, Body)
// 7- Authorization => Bearer Token

// Response (Json) ==> Parse to Model Object
// FromJson => NamedConstructor (Json) => Model

// Bookia
// - UI
// - State Management
// - Apis (Dio)
// - Local Storage (Shared Preferences)

// - Apis Error Handling (dartZ)
// - Clean Architecture (Data / Domain / Presentation)
// - Dependency Injection (GetIt)

// Localization
// 1) translations (Ar, En , Fr) ==> Static / Dynamic
// 2) Widget Layout (RTL , LTR)
// 3) dynamic texts (object response (nameAr, nameEn), header {"locale":"ar"})

// Packages : FlutterLocalizations, EasyLocalization

// ex: You have 5 books in cart;

// ux writing (PM)

// Firebase ()

// Backend services (Supabase, Firebase)
// Auth, Database and Storage

// MVP => APPLICATION(some features) => FEEDBACK
// low requests and without media (LMS)

// Byte+ => Supabase +20 dollar. (Potin) => Backend

// Supabase => SQL => Tables (User,Product, Cart) => Managed
// Firebase => NoSQL => Collections (User,Product, Cart) => Unmanaged

// Migration => Supabase => SqlServer

//Backend Frameworks
// ASP.NET (C#) => SqlServer  => Tables
// Laravel (PHP) => MySql  => Tables
// Django (Python) => MySql  => Tables
// Spring (Java) => MySql / Postgree  => Tables

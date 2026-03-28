import 'package:bookia/app.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(DevicePreview(enabled: false, builder: (context) => const MainApp()));
}

// data resources :

// 1- Apis (Backend)(Remote)
// 2- Local Storage (Shared Preferences, Hive, SQLITE) (Local)
// 3- Backend Services (Firebase, Supabase) (Remote)
// 4- Assets (Json, csv)
// 5- static data

// UI <=> Cubit <=> Data

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

// Response (Json) ==> Parse to Model
// FromJson => NamedConstructor (Json) => Model

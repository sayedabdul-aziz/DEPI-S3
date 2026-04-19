import 'dart:convert';

import 'package:bookia/features/auth/data/models/auth_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences prefs;

  static const String kToken = 'token';
  static const String kUser = 'user';
  static const String kWishlistIds = 'wishlistIds';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserInfo(User? user) async {
    // object ==> json ==> string
    if (user == null) return;
    var objToJson = user.toJson();
    var jsonToString = jsonEncode(objToJson);

    await prefs.setString(kUser, jsonToString);
  }

  static User? getUserInfo() {
    var cachedString = prefs.getString(kUser);
    if (cachedString == null) return null;
    // string ==> json ==> object
    var stringToJson = jsonDecode(cachedString);
    return User.fromJson(stringToJson);
  }

  static Future<void> saveToken(String? token) async {
    if (token == null) return;
    await prefs.setString(kToken, token);
  }

  static String getToken() {
    return prefs.getString(kToken) ?? '';
  }

  static Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String getString(String key) {
    return prefs.getString(key) ?? '';
  }

  static Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  static Future<void> saveWishlistIds(List<String> ids) async {
    await prefs.setStringList(kWishlistIds, ids);
  }

  static List<String> getWishlistIds() {
    return prefs.getStringList(kWishlistIds) ?? [];
  }
}

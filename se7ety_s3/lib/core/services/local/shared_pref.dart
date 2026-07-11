import 'dart:convert';

import 'package:se7ety/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;

  static final String _kUserData = 'user_data';
  static final String _kOnboarding = 'onboarding';

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  static void setUserData(UserModel user) {
    var objToJson = user.toJson();
    var jsonToString = json.encode(objToJson);
    setData(_kUserData, jsonToString);
  }

  static UserModel? getUserData() {
    var jsonToString = getData(_kUserData);
    if (jsonToString == null) return null;
    var objToJson = json.decode(jsonToString);
    return UserModel.fromJson(objToJson);
  }

  static void removeUserData() {
    remove(_kUserData);
  }

  static void setOnboarding() {
    setData(_kOnboarding, true);
  }

  static bool getOnboarding() {
    return getData(_kOnboarding) ?? false;
  }

  static void setData(String key, dynamic value) {
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static Future<bool> clear() {
    return pref.clear();
  }

  static Future<bool> remove(String key) {
    return pref.remove(key);
  }
}

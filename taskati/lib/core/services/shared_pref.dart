// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPref {
//   static late final SharedPreferences prefs;

//   static const String nameKey = 'name';
//   static const String imageKey = 'image';
//   static const String isUploadedKey = 'isUploaded';

//   static Future<void> init() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   // helper methods
//   static Future<void> setUserInfo(String name, String image) async {
//     await setString(nameKey, name);
//     await setString(imageKey, image);
//   }

//   static Future<void> setString(String key, String value) async {
//     await prefs.setString(key, value);
//   }

//   static String getString(String key) {
//     return prefs.getString(key) ?? '';
//   }

//   static Future<void> setBool(String key, bool value) async {
//     await prefs.setBool(key, value);
//   }

//   static bool getBool(String key) {
//     return prefs.getBool(key) ?? false;
//   }
// }

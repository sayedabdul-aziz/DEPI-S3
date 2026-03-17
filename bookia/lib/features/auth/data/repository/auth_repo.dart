import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';

class AuthRepo {
  Future<AuthResponse?> login(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        path: Apis.baseUrl + Apis.login,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        // namedConstructor (Json) => Model
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<AuthResponse?> register(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        path: Apis.baseUrl + Apis.register,
        data: params.toJson(),
      );

      if (response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

// Json(Map)
// Map["data"]["user"]["image"]

// map.data.user;

import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/data/models/edit_profile_params.dart';
import 'package:bookia/features/profile/data/models/profile_response/profile_response.dart';

class ProfileRepo {
  static Future<ProfileResponse?> updateProfile(
    EditProfileParams params,
  ) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updateProfile,
        data: await params.toFormData(),
        headers: {
          'Authorization': 'Bearer ${SharedPref.getToken()}',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return ProfileResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

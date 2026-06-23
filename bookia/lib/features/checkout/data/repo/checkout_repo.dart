import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/checkout/data/models/governorate_response/governorate_response.dart';
import 'package:bookia/features/checkout/data/models/place_order_params.dart';

class CheckoutRepo {
  static Future<GovernorateResponse?> getGovernorates() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.governorates,
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 200) {
        return GovernorateResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> placeOrder(PlaceOrderParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.placeOrder,
        data: params.toJson(),
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }
}

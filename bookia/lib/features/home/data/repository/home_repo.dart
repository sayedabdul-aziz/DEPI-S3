import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/sliders_response/sliders_response.dart';

class HomeRepo {
  static Future<SlidersResponse?> getSliders() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SlidersResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<BestSellerResponse?> getBestSellers() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.productsBestSeller);
      if (response.statusCode == 200) {
        return BestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/features/search/data/model/search_response/search_response.dart';

class SearchRepo {
  static Future<SearchResponse?> search(String name) async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.search,
        queryParameters: {"name": name},
      );

      if (response.statusCode == 200) {
        return SearchResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}

// res["data"]["products"][0]["name"]
// res.data.products[0].name

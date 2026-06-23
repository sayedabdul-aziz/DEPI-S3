import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';

class CartRepo {
  static Future<CartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.cart,
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 200) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> addToCart(int productId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.addToCart,
        data: {'product_id': productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 201) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart(int cartItemId) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.removeFromCart,
        data: {'cart_item_id': cartItemId},
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 200) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> updateCart(int cartItemId, int quantity) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updateCart,
        data: {'cart_item_id': cartItemId, 'quantity': quantity},
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 201) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> checkout() async {
    try {
      var response = await DioProvider.get(
        endpoint: Apis.checkout,
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );
      if (response.statusCode == 200) {
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

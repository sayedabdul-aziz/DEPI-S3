import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static void init() {
    dio = Dio();
  }

  static Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> patch({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}

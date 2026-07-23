import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/base_response.dart';
import 'package:bookia/core/services/apis/failures.dart';
import 'package:chili_debug_view/chili_debug_view.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static void init() {
    // configure Dio
    dio = Dio(
      BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.addAll([NetworkLoggerInterceptor()]);
  }

  static Future<Either<Failure, dynamic>> postApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> getApi({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // {
  //  "id" : 7,
  //  "name" : "test",
  // }

  static Future<Either<Failure, dynamic>> _handleResponse(
    Response response,
  ) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        if (response.data["status"] != null) {
          var data = BaseResponse.fromJson(response.data);
          return Right(data.data);
        } else {
          return Right(response.data);
        }
      } on Exception catch (e) {
        return Left(ParseFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: response.data['message']));
    }
  }

  static Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection Timeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: e.message);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: e.message);
      case DioExceptionType.badCertificate:
        return ServerFailure(message: e.message);
      case DioExceptionType.badResponse:
        final responseData = e.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData['errors'] != null) {
          final parsed = BaseResponse.fromJson(responseData);
          return ServerFailure(
            code: e.response?.statusCode,
            message: parsed.firstError,
          );
        }
        return ServerFailure(
          code: e.response?.statusCode,
          message: responseData?['message'],
        );
      case DioExceptionType.cancel:
        return ServerFailure(message: e.message);
      case DioExceptionType.connectionError:
        return ServerFailure(message: e.message);
      case DioExceptionType.unknown:
        return ServerFailure(message: e.message);
    }
  }

  static Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> patch({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.patch(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}

// base response

// call postApi / getApi
//         │
//         ▼
//    dio.post / dio.get
//         │
//    ┌────┴────┐
// success    DioException
//    │              │
//    ▼              ▼
// _handleResponse   _handleDioException
//    │                      │
//    ▼                      ▼
// status 200/201?        Left(ServerFailure)
//    │
//    ├── has "status" key? → parse via BaseResponse → Right(data.data)
//    ├── no "status" key?  → Right(response.data)   (raw response)
//    └── parse throws?     → Left(ParseFailure)

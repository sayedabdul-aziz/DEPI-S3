import 'dart:developer';

import 'package:bookia/core/services/apis/apis.dart';
import 'package:bookia/core/services/apis/dio_provider.dart';
import 'package:bookia/core/services/apis/failures.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthDataSource {
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
}

class AuthRemoteDataSourceImpl implements AuthDataSource {
  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
    var result = await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );

    return result.fold(
      (l) {
        log(l.message.toString());
        return Left(l);
      },
      (r) {
        var data = AuthResponse.fromJson(r);
        SharedPref.saveToken(data.token);
        SharedPref.saveUserInfo(data.user);
        return Right(data);
      },
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) async {
    var result = await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );

    return result.fold(
      (l) {
        log(l.message.toString());
        return Left(l);
      },
      (r) {
        var data = AuthResponse.fromJson(r);
        SharedPref.saveToken(data.token);
        SharedPref.saveUserInfo(data.user);
        return Right(data);
      },
    );
  }
}

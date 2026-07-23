import 'package:bookia/core/services/apis/failures.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
}

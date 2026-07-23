import 'package:bookia/core/services/apis/failures.dart';
import 'package:bookia/features/auth/data/data_source/auth_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource dataSource;

  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) {
    // check connection
    // check local or remote
    return dataSource.login(params);
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) {
    return dataSource.register(params);
  }
}


// Manager
// worker
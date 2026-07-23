import 'package:bookia/core/services/apis/failures.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:bookia/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Either<Failure, AuthResponse>> call(AuthParams params) {
    // do mapping
    // merging
    // complex logic
    return authRepo.login(params);
  }
}

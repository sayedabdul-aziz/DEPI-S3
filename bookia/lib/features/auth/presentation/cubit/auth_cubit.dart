import 'dart:developer';

import 'package:bookia/core/di/service_locator.dart';
import 'package:bookia/features/auth/data/data_source/auth_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/repository/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/usecase/login_usecase.dart';
import 'package:bookia/features/auth/domain/usecase/register_usecase.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final loginUseCase = locator<LoginUseCase>();
  final registerUseCase = RegisterUseCase(
    AuthRepoImpl(AuthRemoteDataSourceImpl()),
  );

  Future<void> login() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );
    var data = await loginUseCase.call(params);

    data.fold(
      (l) {
        log(l.message.toString());
        emit(AuthErrorState(message: l.message ?? ''));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );
    var data = await registerUseCase.call(params);

    data.fold(
      (l) {
        log(l.message.toString());
        emit(AuthErrorState(message: l.message ?? ''));
      },
      (r) {
        emit(AuthSuccessState());
      },
    );
  }
}

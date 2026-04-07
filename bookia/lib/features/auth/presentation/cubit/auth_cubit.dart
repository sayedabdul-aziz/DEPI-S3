import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/repository/auth_repo.dart';
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

  Future<void> login() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );
    var data = await AuthRepo.login(params);
    if (data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Something went wrong, please try again"));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );
    var data = await AuthRepo.register(params);
    if (data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(message: "Something went wrong, please try again"));
    }
  }
}

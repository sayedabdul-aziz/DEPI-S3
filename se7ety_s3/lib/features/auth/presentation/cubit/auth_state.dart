import 'package:se7ety/features/auth/data/models/user_type_enum.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserTypeEnum userType;
  final bool? isCompleteProfile;

  AuthSuccessState({required this.userType, this.isCompleteProfile});
}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState({required this.message});
}

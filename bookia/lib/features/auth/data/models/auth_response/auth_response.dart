import 'user.dart';

class AuthResponse {
  User? user;
  String? token;

  AuthResponse({this.user, this.token});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String?,
  );

  Map<String, dynamic> toJson() => {'user': user?.toJson(), 'token': token};
}

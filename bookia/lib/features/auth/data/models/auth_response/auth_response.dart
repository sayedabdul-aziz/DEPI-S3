import 'data.dart';

class AuthResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  AuthResponse({this.data, this.message, this.error, this.status});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}

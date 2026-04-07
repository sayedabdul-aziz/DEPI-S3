import 'data.dart';

class SearchResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  SearchResponse({this.data, this.message, this.error, this.status});

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }
}

class BaseResponse {
  int? status;
  String? message;
  List<dynamic>? error;
  Map<String, List<dynamic>>? errors;
  dynamic data;

  BaseResponse({this.status, this.message, this.error, this.errors, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    error = json['error'];
    data = json['data'];
    if (json['errors'] != null) {
      errors = (json['errors'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, List<dynamic>.from(value)),
      );
    }
  }

  // Returns the first validation error message, or falls back to message.
  String? get firstError {
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first.toString();
    }
    return message;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['error'] = error;
    data['errors'] = errors;
    data['data'] = this.data;
    return data;
  }
}

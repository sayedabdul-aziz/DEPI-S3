import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileParams {
  final String? name;
  final String? phone;
  final String? address;
  final File? image;

  EditProfileParams({this.name, this.phone, this.address, this.image});

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'address': address,
  };

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (image != null)
        "image": await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
    });
  }
}

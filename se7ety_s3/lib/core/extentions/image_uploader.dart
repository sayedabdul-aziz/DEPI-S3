import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

Future<String?> uploadImageToCloudinary(File imageFile) async {
  try {
    final response = await Dio().post(
      'https://api.cloudinary.com/v1_1/dup0vzih4/image/upload',
      data: FormData.fromMap({
        'upload_preset': 'se7ety',
        'file': await MultipartFile.fromFile(imageFile.path),
      }),
    );

    if (response.statusCode == 200) {
      log('responseData: ${response.data}');
      return response.data['secure_url'];
    } else {
      log('Failed to upload image. Status code: ${response.statusCode}');
      return null;
    }
  } on DioException catch (e) {
    log('Error uploading image: ${e.message}');
    return null;
  }
}

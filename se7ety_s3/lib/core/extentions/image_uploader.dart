import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String?> uploadImageToCloudinary(File imageFile) async {
  // 1. Create the upload URL
  final url = Uri.parse(
    'https://api.cloudinary.com/v1_1/dup0vzih4/image/upload',
  );

  // 2. Create a new multipart request
  final request = http.MultipartRequest('POST', url);

  // 3. Add the upload preset
  request.fields['upload_preset'] = "se7ety";

  // 4. Add the file to the request
  request.files.add(
    await http.MultipartFile.fromPath(
      'file', // This 'file' key is required by Cloudinary
      imageFile.path,
    ),
  );

  try {
    // 5. Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      // 6. Read and decode the response
      final responseBody = await response.stream.bytesToString();
      final responseData = json.decode(responseBody);

      // 7. Return the secure URL
      log('responseData: $responseData');
      return responseData['secure_url'];
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
      final errorBody = await response.stream.bytesToString();
      print('Error response: $errorBody');
      return null;
    }
  } catch (e) {
    print('Error uploading image: $e');
    return null;
  }
}

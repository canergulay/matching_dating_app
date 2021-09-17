import 'dart:io';

import 'package:dio/dio.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

class UploadImageDS {
  Future<Result<String>> uploadUserImage(String imagePath) async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath, filename: 'myimage'),
    });
    final response = await NetworkManager.instance.dio.post('/imageupload', data: formData);
    print(response.data);
    if (response.statusCode == HttpStatus.ok && response.data['status'] == 'success') {
      print(response.data);
      return Result.success(response.data['image']);
    } else {
      throw CustomError();
    }
  }
}

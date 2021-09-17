import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/datasources/upload_image_datasource.dart';
import 'dart:io';

import 'package:matchangoo/features/Identification/domain/repositories/upload_single_image_contract.dart';

class UploadUserImageRepositary implements UploadUserPhotoContract {
  final UploadImageDS uploadImageDS;
  UploadUserImageRepositary({required this.uploadImageDS});
  @override
  Future<Result<String>> uploadUserPhoto(String imagePath) async {
    try {
      return await uploadImageDS.uploadUserImage(imagePath);
    } on CustomError {
      return Result.error(CustomError(errorCode: 10));
    } catch (e) {
      return Result.error(CustomError(errorCode: 20));
    }
  }
}

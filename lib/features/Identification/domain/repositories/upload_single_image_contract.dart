import 'dart:io';

import 'package:matchangoo/core/result_error/result_freezed/result.dart';

abstract class UploadUserPhotoContract {
  Future<Result<String>> uploadUserPhoto(String imagePath);
}

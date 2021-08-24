import 'dart:io';

import 'package:dio/dio.dart';
import 'package:matchangoo/core/constants/networkpath.dart';
import 'package:matchangoo/core/init/network/network_manager.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';

abstract class IVerificationEmailDataSource {
  Future<Result> sendVerificationEmail(String email);
  Future<Result> checkVerificationCode(VerificationControl verificationControl);
}

class VerificationEmailDataSource extends IVerificationEmailDataSource {
  @override
  Future<Result<bool>> checkVerificationCode(VerificationControl verificationControl) async {
    try {
      final response = await NetworkManager.instance.dio.post(
        "/auth/verifymail",
        data: {"email": verificationControl.verificationEmail, "code": verificationControl.verificationCode},
      );
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(true);
      } else {
        return Result.success(false);
      }
    } catch (e) {
      print(e);
      return Result.error(CustomError(message: 'An unexpected error has appeared'));
    }
  }

  @override
  Future<Result<bool>> sendVerificationEmail(String email) async {
    try {
      final response = await NetworkManager.instance.dio.post(
        "/auth/sendmail",
        data: {"email": email},
      );
      if (response.statusCode == HttpStatus.ok && response.data == "success") {
        return Result.success(true);
      } else {
        return Result.error(CustomError(message: 'We have an error with code ${response.statusCode} and the message is "${response.data}"'));
      }
    } catch (e) {
      print(e);
      return Result.error(CustomError(message: 'An unexpected error has appeared'));
    }
  }
}

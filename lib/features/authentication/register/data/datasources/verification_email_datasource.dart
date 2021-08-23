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
    return await Future.value(Result.success(true));
  }

  @override
  Future<Result<bool>> sendVerificationEmail(String email) {
    return Future.value(Result.success(true));
  }
}

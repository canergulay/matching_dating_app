import '../../../../../core/result_error/result_freezed/result.dart';
import '../entities/verification_control.dart';

abstract class IVerificationEmailRepositary {
  Future<Result<bool>> sendVerificationMail(String verificationEmail);
  Future<Result<bool>> checkVerificationCode(VerificationControl verificationControl);
}

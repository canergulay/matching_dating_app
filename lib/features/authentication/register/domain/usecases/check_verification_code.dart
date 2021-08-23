import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/verification_email_repositary.dart';
import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';

class CheckVerificationEmail {
  VerificationEmailRepositary verificationEmailRepositary;
  CheckVerificationEmail({required this.verificationEmailRepositary});
  Future<Result<bool>> call(VerificationControl verificationControl) async {
    return await verificationEmailRepositary.checkVerificationCode(verificationControl);
  }
}

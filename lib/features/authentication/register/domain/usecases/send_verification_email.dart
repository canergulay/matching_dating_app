import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/verification_email_repositary.dart';

class SendVerificationEmail {
  VerificationEmailRepositary verificationEmailRepositary;
  SendVerificationEmail({required this.verificationEmailRepositary});

  Future<Result<bool>> call(String email) async {
    return await verificationEmailRepositary.sendVerificationMail(email);
  }
}

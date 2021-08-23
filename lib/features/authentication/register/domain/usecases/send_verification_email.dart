import 'package:matchangoo/features/authentication/register/data/repositories/verification_email_repositary.dart';

class SendVerificationEmail {
  VerificationEmailRepositary verificationEmailRepositary;
  SendVerificationEmail({required this.verificationEmailRepositary});

  Future<bool> call(String email) async {
    return await verificationEmailRepositary.sendVerificationMail(email);
  }
}

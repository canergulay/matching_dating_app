import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';

abstract class IVerificationEmailRepositary {
  Future<bool> sendVerificationMail(String verificationEmail);
  Future<bool> checkVerificationCode(VerificationControl verificationControl);
}

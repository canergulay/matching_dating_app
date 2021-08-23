import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';

abstract class IVerificationEmailDataSource {
  Future<bool> sendVerificationEmail(String email);
  Future<bool> checkVerificationCode(VerificationControl verificationControl);
}

class VerificationEmailDataSource extends IVerificationEmailDataSource {
  @override
  Future<bool> checkVerificationCode(VerificationControl verificationControl) {
    return Future.value(true);
  }

  @override
  Future<bool> sendVerificationEmail(String email) {
    return Future.value(true);
  }
}

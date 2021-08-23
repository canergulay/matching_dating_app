import 'package:matchangoo/features/authentication/register/data/datasources/verification_email_datasource.dart';
import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';
import 'package:matchangoo/features/authentication/register/domain/repositories/verification_email_repositary_contract.dart';

class VerificationEmailRepositary extends IVerificationEmailRepositary {
  final VerificationEmailDataSource verificationEmailDataSource;

  VerificationEmailRepositary({required this.verificationEmailDataSource});

  @override
  Future<bool> sendVerificationMail(String verificationEmail) {
    return verificationEmailDataSource.sendVerificationEmail(verificationEmail);
  }

  @override
  Future<bool> checkVerificationCode(VerificationControl verificationControl) {
    return verificationEmailDataSource.checkVerificationCode(verificationControl);
  }
}

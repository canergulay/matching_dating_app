import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/datasources/verification_email_datasource.dart';
import 'package:matchangoo/features/authentication/register/domain/entities/verification_control.dart';
import 'package:matchangoo/features/authentication/register/domain/repositories/verification_email_repositary_contract.dart';

class VerificationEmailRepositary extends IVerificationEmailRepositary {
  final VerificationEmailDataSource verificationEmailDataSource;

  VerificationEmailRepositary({required this.verificationEmailDataSource});

  @override
  Future<Result<bool>> sendVerificationMail(String verificationEmail) async {
    try {
      return await verificationEmailDataSource.sendVerificationEmail(verificationEmail);
    } catch (error) {
      return Result.error(CustomError(isException: true));
    }
  }

  @override
  Future<Result<bool>> checkVerificationCode(VerificationControl verificationControl) async {
    try {
      return await verificationEmailDataSource.checkVerificationCode(verificationControl);
    } catch (error) {
      return Result.error(CustomError(isException: true));
    }
  }
}

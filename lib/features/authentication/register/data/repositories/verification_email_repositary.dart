import '../../../../../core/result_error/errors/custom_error.dart';
import '../../../../../core/result_error/result_freezed/result.dart';
import '../datasources/verification_email_datasource.dart';
import '../../domain/entities/verification_control.dart';
import '../../domain/repositories/verification_email_repositary_contract.dart';

class VerificationEmailRepositary extends IVerificationEmailRepositary {
  final VerificationEmailDataSource verificationEmailDataSource;

  VerificationEmailRepositary({required this.verificationEmailDataSource});

  @override
  Future<Result<bool>> sendVerificationMail(String verificationEmail) async {
    try {
      return await verificationEmailDataSource.sendVerificationEmail(verificationEmail);
    } catch (error) {
      return Result.error(CustomError());
    }
  }

  @override
  Future<Result<bool>> checkVerificationCode(VerificationControl verificationControl) async {
    try {
      return await verificationEmailDataSource.checkVerificationCode(verificationControl);
    } catch (error) {
      return Result.error(CustomError());
    }
  }
}

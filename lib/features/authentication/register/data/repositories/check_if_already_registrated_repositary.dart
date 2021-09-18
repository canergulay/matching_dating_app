import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/datasources/check_if_already_registrated_ds.dart';
import 'package:matchangoo/features/authentication/register/domain/repositories/check_if_already_registrated_repo_contract.dart';

class CheckIfAlreadyRegistratedRepo implements CheckIfAlreadyRegistratedContarct {
  final CheckIfAlreadyRegisteredDS checkIfAlreadyRegisteredDS;

  CheckIfAlreadyRegistratedRepo({required this.checkIfAlreadyRegisteredDS});

  @override
  Future<Result<bool>> checkIfAlreadyRepositary(String email) async {
    try {
      final alreadyRegistered = await checkIfAlreadyRegisteredDS.checkIfAlreadyRegistratedDS(email);
      return Result.success(alreadyRegistered);
    } on ServerException {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.serverException));
    } on UnexpectedException {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.unexpectedException));
    } catch (e) {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.unexpectedException));
    }
  }
}

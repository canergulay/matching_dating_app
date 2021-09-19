import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/check_if_acc_exist_ds.dart';
import 'package:matchangoo/features/authentication/login/domain/repositories/chec_if_acc_exist_repositary_contract.dart';

class CheckIfAccounExistRepositary implements CheckIfAccountExistRepositaryContract {
  final CheckIfAccountExistDataSource checkIfAccountExistDataSource;
  CheckIfAccounExistRepositary({required this.checkIfAccountExistDataSource});

  @override
  Future<Result<bool>> checkIfAccountExist({required String email}) async {
    try {
      final bool = await checkIfAccountExistDataSource.checkIfAccountExist(email: email);
      return Result.success(bool);
    } on ServerException {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.serverException));
    } on UnexpectedException {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.unexpectedException));
    } catch (e) {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.unexpectedException));
    }
  }
}

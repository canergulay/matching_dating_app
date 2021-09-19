import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/login_datasource.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/domain/repositories/login_repositary_contract.dart';

class LoginRepositary implements LoginRepositaryContract {
  LoginRepositary({required this.loginDataSource});
  final LoginDataSource loginDataSource;
  @override
  Future<Result<UserModel>> login({required String email, required String password}) async {
    try {
      final UserModel user = await loginDataSource.loginService(email: email, password: password);
      return Result.success(user);
    } on WrongPassword {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.wrongPassword));
    } on NoAccount {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.notAnAccount));
    } on ServerException {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.serverException));
    } catch (e) {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.unexpectedException));
    }
  }
}

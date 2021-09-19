import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/features/authentication/login/data/datasources/user_repositary_datasource.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/domain/repositories/user_repositary_contract.dart';

class UserRepositary implements UserRepositaryContract {
  final UserDataSource userRepositaryDataSource;
  UserRepositary({required this.userRepositaryDataSource});
  @override
  Future<Result<UserModel?>> getUserByToken(String token) async {
    try {
      final UserModel? user = await userRepositaryDataSource.getUserByToken(token);
      return Result.success(user);
    } on UnAuthorized {
      return Result.error(CustomError(errorCode: ErrorConstants.shared.tokenIsNotValid));
    } catch (e) {
      return Result.error(CustomError());
    }
  }
}

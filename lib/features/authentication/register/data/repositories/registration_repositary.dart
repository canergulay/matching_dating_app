import 'package:matchangoo/core/appetizers/exceptions_errors/exceptions.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/datasources/registration_datasource.dart';
import 'package:matchangoo/features/authentication/register/domain/repositories/registration_repositary_contract.dart';

class RegistrationRepositary implements RegistrationRepositaryContract {
  final RegistrationDataSource dataSource;
  RegistrationRepositary({required this.dataSource});
  @override
  Future<Result<UserModel>> register(RegistrationEntity registrationEntity) async {
    try {
      final UserModel? userModel = await dataSource.registration(registrationEntity);
      if (userModel != null) {
        return Result.success(userModel);
      } else {
        return Result.error(CustomError(errorCode: 12));
      }
    } on AlreadyRegistered {
      return Result.error(CustomError(errorCode: 11));
    } on ServerException {
      return Result.error(CustomError(errorCode: 10));
    } catch (e) {
      return Result.error(CustomError(errorCode: 12));
    }
  }
}

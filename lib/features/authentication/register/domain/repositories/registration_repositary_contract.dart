import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

abstract class RegistrationRepositaryContract {
  Future<Result<UserModel>> register(RegistrationEntity registrationEntity);
}

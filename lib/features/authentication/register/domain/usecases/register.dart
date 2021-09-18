import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/domain/entities/registration_entity.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/registration_repositary.dart';

class Register {
  final RegistrationRepositary registrationRepositary;
  Register({required this.registrationRepositary});
  Future<Result<UserModel>> call(RegistrationEntity registrationEntity) async {
    return await registrationRepositary.register(registrationEntity);
  }
}

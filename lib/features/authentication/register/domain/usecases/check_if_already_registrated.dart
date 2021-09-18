import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/register/data/repositories/check_if_already_registrated_repositary.dart';

class CheckIfAlreadyRegistered {
  final CheckIfAlreadyRegistratedRepo checkIfAlreadyRegistratedRepo;
  CheckIfAlreadyRegistered({required this.checkIfAlreadyRegistratedRepo});

  Future<Result<bool>> call(String email) async {
    return await checkIfAlreadyRegistratedRepo.checkIfAlreadyRepositary(email);
  }
}

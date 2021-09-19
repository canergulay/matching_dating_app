import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/repositories/check_if_acc_exist_repo_implementation.dart';

class CheckIfAccountExist {
  CheckIfAccountExist({required this.checkIfAccounExistRepositary});
  final CheckIfAccounExistRepositary checkIfAccounExistRepositary;
  Future<Result<bool>> call({required String email}) async {
    return await checkIfAccounExistRepositary.checkIfAccountExist(email: email);
  }
}

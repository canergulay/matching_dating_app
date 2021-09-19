import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

abstract class CheckIfAccountExistRepositaryContract {
  Future<Result<UserModel>> checkIfAccountExist({required String email});
}

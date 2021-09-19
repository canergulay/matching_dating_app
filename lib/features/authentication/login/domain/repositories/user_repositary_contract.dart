import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';

abstract class UserRepositaryContract {
  Future<Result<UserModel?>> getUserByToken(String token);
}
